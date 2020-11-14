import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { WardMonitorDashboardComponent } from './ward-monitor-dashboard/ward-monitor-dashboard.component';
import { WardMonitorComponent } from './ward-monitor.component';

const routes: Routes = [
  {
    path: '',
    component: WardMonitorComponent,
    children: [
      {
        path: '',
        pathMatch: 'full',
        component: WardMonitorDashboardComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WardMonitorRoutingModule { }
