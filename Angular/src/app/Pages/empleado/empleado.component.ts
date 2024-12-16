import { Component, ElementRef, inject, Input, input, OnInit, ViewChild } from '@angular/core';

import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { FormBuilder, ReactiveFormsModule, FormGroup } from '@angular/forms'
import { EmpleadoService } from '../../Services/empleado.service';
import { Route, Router } from '@angular/router';
import flatpickr from 'flatpickr';
import { Spanish } from 'flatpickr/dist/l10n/es.js';
import { Empleado } from '../../Models/Empleado';

@Component({
  selector: 'app-empleado',
  standalone: true,
  imports: [MatInputModule, MatFormFieldModule, MatButtonModule, ReactiveFormsModule],
  templateUrl: './empleado.component.html',
  styleUrl: './empleado.component.css'
})
export class EmpleadoComponent implements OnInit {
  @Input('IdEmpleado') idEmpleado!: number;
  
  private empleadoServicio = inject(EmpleadoService);
  public formBuil = inject(FormBuilder);

  public formEmpleado: FormGroup = this.formBuil.group({
    nombre: [''],
    correo: [''],
    sueldo: [0],
    fechaContrato: ['']
  });
  constructor(private router: Router) { }
  ngOnInit(): void {
    if (this.idEmpleado != 0) {
      this.empleadoServicio.GetById(this.idEmpleado).subscribe({
        next: (data) => {
          this.formEmpleado.patchValue({
            nombre: data.object.nombre,
            correo: data.object.correo,
            sueldo: data.object.sueldo,
            fechaContrato: data.object.fechaContrato
          })
        },
        error: (err) => {
          console.log(err.ErrorMessage)
        }
      })
    }  
  }


  Add() {
    const objeto: Empleado = {
      idEmpleado: this.idEmpleado,
      nombre: this.formEmpleado.value.nombre,
      correo: this.formEmpleado.value.correo,
      sueldo: this.formEmpleado.value.sueldo,
      fechaContrato: this.formEmpleado.value.fechaContrato
    }
    if (this.idEmpleado == 0) {
      this.empleadoServicio.Add(objeto).subscribe({
        next: (data) => {
          if (data.correct) {
            this.router.navigate(["/"]);
          } else {
            alert("Error al crear")
          }
        },
        error: (err) => {
          console.log(err.ErrorMessage)
        }
      })
    } else {
      this.empleadoServicio.Update(objeto).subscribe({
        next: (data) => {
          if (data.correct) {
            this.router.navigate(["/"]);
          } else {
            alert("Error al editar")
          }
        },
        error: (err) => {
          console.log(err.ErrorMessage)
        }
      })

    }
  }

  regresar(){
    this.router.navigate(["/"]);
  }
}
