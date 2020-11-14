import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NurseRoutingModule } from './nurse-routing.module';
import { NurseDashboardComponent } from './nurse-dashboard/nurse-dashboard.component';
import { NurseComponent } from './nurse.component';
import { MaterialModule } from '../material.module';
import { PatientStatusComponent } from './nurse-dashboard/patient-status/patient-status.component';

@NgModule({
  declarations: [
    NurseComponent,
    NurseDashboardComponent,
    PatientStatusComponent
  ],
  imports: [
    CommonModule,
    NurseRoutingModule,
    MaterialModule
  ]
})
export class NurseModule { }
