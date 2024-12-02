import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { appsettings } from '../Settings/appsettings';
import { Empleado } from '../Models/Empleado';
import { Result } from '../Models/Result';

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {

  private http=inject(HttpClient);
  private apiUrl:string =appsettings.apiUrl;
  constructor() { }

  GetAll(){
    return this.http.get<Result>(`${this.apiUrl}GetAll`)
  }
  GetById(IdEmpleado:number){
    return this.http.get<Result>(`${this.apiUrl}GetById/${IdEmpleado}`)
  }
  Add(Empleado:Empleado){
    return this.http.post<Result>(`${this.apiUrl}Add`, Empleado)
  }
  Update(empleado:Empleado){
    return this.http.put<Result>(`${this.apiUrl}Update`, empleado)
  }
  Delete(IdEmpleado:number){
    return this.http.delete<Result>(`${this.apiUrl}Delete/${IdEmpleado}`)
  }

}
