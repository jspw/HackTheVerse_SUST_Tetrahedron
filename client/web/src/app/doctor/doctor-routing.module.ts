import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppointmentTableComponent } from './appointment-table/appointment-table.component';
import { DoctorHomeComponent } from './doctor-home/doctor-home.component';
import { DoctorComponent } from './doctor.component';
import { PrescriptionFormComponent } from './prescription-form/prescription-form.component';

const routes: Routes = [
  {
    path: '',
    component: DoctorComponent,
    children: [
      {
        path: '',
        pathMatch: 'full',
        component: DoctorHomeComponent
      },
      {
        path: 'appointment',
        component: AppointmentTableComponent
      },
      {
        path: 'prescription/create',
        component: PrescriptionFormComponent
      },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DoctorRoutingModule { }
