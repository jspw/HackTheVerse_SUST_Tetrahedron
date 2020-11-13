import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppointmentFormComponent } from './appointment-form/appointment-form.component';
import { AppointmentHomeComponent } from './appointment-home/appointment-home.component';
import { MedicalTimelineComponent } from './medical-timeline/medical-timeline.component';
import { PatientComponent } from './patient.component';

const routes: Routes = [
  {
    path: '',
    component: PatientComponent,
    children: [
      {
        path: '',
        pathMatch: 'full',
        component: AppointmentHomeComponent
      },
      {
        path: 'appointment',
        component: AppointmentFormComponent
      },
      {
        path: 'medical-timeline',
        component: MedicalTimelineComponent
      },
    ]
  },
  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PatientRoutingModule { }
