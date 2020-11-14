import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NurseRoutingModule } from './nurse-routing.module';
import { NurseDashboardComponent } from './nurse-dashboard/nurse-dashboard.component';


@NgModule({
  declarations: [
    
  NurseDashboardComponent],
  imports: [
    CommonModule,
    NurseRoutingModule
  ]
})
export class NurseModule { }
