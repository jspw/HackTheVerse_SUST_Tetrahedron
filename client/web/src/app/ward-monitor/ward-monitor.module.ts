import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WardMonitorRoutingModule } from './ward-monitor-routing.module';
import { WardMonitorComponent } from './ward-monitor.component';
import { WardMonitorDashboardComponent } from './ward-monitor-dashboard/ward-monitor-dashboard.component';
import { MaterialModule } from '../material.module';


@NgModule({
  declarations: [WardMonitorComponent, WardMonitorDashboardComponent],
  imports: [
    CommonModule,
    WardMonitorRoutingModule,
    MaterialModule
  ]
})
export class WardMonitorModule { }
