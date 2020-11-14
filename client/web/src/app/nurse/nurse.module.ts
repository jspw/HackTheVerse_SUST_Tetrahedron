import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NurseRoutingModule } from './nurse-routing.module';
import { NurseDashboardComponent } from './nurse-dashboard/nurse-dashboard.component';
import { NurseComponent } from './nurse.component';


@NgModule({
  declarations: [
    NurseComponent,
    NurseDashboardComponent
  ],
  imports: [
    CommonModule,
    NurseRoutingModule
  ]
})
export class NurseModule { }
