import { Component, inject } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { EmpleadoService } from '../../Services/empleado.service';
import { Empleado } from '../../Models/Empleado';
import { Router } from '@angular/router';
import { Result } from '../../Models/Result';
import { CommonModule } from '@angular/common'; // Importa CommonModule

@Component({
  selector: 'app-inicio',
  standalone: true,
  imports: [MatCardModule, MatTableModule, MatIconModule, MatButtonModule, CommonModule], // Agrega CommonModule aquí
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent {
  private empleadoServicio = inject(EmpleadoService);
  public Empleados: Empleado[] = [];
  public displayedColumns: string[] = ['nombre', 'correo', 'sueldo', 'fechaContrato', 'accion'];

  GetAll() {
    this.empleadoServicio.GetAll().subscribe({
      next: (data: Result) => {
        if (data.objects && data.correct) {
          this.Empleados = data.objects; // Asignar directamente la lista de empleados
        } else {
          console.error('Error al obtener empleados:', data.errorMessage);
        }
      },
      error: (error) => {
        console.error('Error en la solicitud HTTP:', error);
      }
    });
  }
  
  constructor(private router: Router) {
    this.GetAll();
  }

  Add() {
    this.router.navigate(['/Add', 0]);
  }

  Update(Objecto: Empleado) {
    this.router.navigate(['/Update/', Objecto.idEmpleado]);
  }

  Delete(Objecto: Empleado) {
    if (confirm(`Desea eliminar el empleado ${Objecto.nombre}?`)) {
      this.empleadoServicio.Delete(Objecto.idEmpleado).subscribe({
        next: (data) => {
          if (data.correct) {
            this.GetAll();
          } else {
            alert("No se pudo eliminar");
          }
        },
        error: (error) => {
          console.log(error.ErrorMessage);
        }
      });
    }
  }
}
