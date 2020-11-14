import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { WardMonitorDashboardComponent } from './ward-monitor-dashboard/ward-monitor-dashboard.component';
import { WardMonitorComponent } from './ward-monitor.component';
import {DataVisualizationComponent} from './../ward-monitor/data-visualization/data-visualization.component';

const routes: Routes = [
  {
    path: '',
    component: WardMonitorComponent,
    children: [
      {
        path: '',
        pathMatch: 'full',
        component: WardMonitorDashboardComponent
      },
      {
        path: 'live-monitoring',
        pathMatch: 'full',
        component: DataVisualizationComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WardMonitorRoutingModule { }
