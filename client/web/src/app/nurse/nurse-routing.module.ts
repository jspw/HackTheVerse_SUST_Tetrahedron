import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NurseDashboardComponent } from './nurse-dashboard/nurse-dashboard.component';
import { NurseComponent } from './nurse.component';

const routes: Routes = [
  {
    path: '',
    component: NurseComponent,
    children: [
      {
        path: '',
        pathMatch: 'full',
        component: NurseDashboardComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NurseRoutingModule { }
