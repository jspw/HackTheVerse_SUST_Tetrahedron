import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WardMonitorRoutingModule } from './ward-monitor-routing.module';
import { WardMonitorComponent } from './ward-monitor.component';
import { WardMonitorDashboardComponent } from './ward-monitor-dashboard/ward-monitor-dashboard.component';
import { MaterialModule } from '../material.module';
import { PatientStatusTableComponent } from './ward-monitor-dashboard/patient-status-table/patient-status-table.component';
import { DataVisualizationComponent } from './data-visualization/data-visualization.component';
import { ReactiveFormsModule } from '@angular/forms';
import { PatientAdmissionFormComponent } from './patient-admission-form/patient-admission-form.component';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    WardMonitorComponent, 
    WardMonitorDashboardComponent, 
    PatientStatusTableComponent, 
    DataVisualizationComponent, PatientAdmissionFormComponent,
  ],
  imports: [
    CommonModule,
    WardMonitorRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    MaterialModule,
  ]
})
export class WardMonitorModule { }
