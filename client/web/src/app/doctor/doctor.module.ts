import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DoctorRoutingModule } from './doctor-routing.module';
import { DoctorComponent } from './doctor.component';
import { AppointmentTableComponent } from './appointment-table/appointment-table.component';
import { MaterialModule } from '../material.module';
import { PrescriptionFormComponent } from './prescription-form/prescription-form.component';
import { DoctorHomeComponent } from './doctor-home/doctor-home.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    DoctorComponent,
    AppointmentTableComponent,
    PrescriptionFormComponent,
    DoctorHomeComponent
  ],
  imports: [
    CommonModule,
    DoctorRoutingModule,
    ReactiveFormsModule,

    MaterialModule
  ]
})
export class DoctorModule { }
