import { NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules } from '@angular/router';
import { WardMonitorModule } from './ward-monitor/ward-monitor.module';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: '/auth/login'
  },
  {
    path: 'auth',
    loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule)
  },
  {
    path: 'doctor',
    loadChildren: () => import('./doctor/doctor.module').then(m => m.DoctorModule)
  },
  {
    path: 'patient',
    loadChildren: () => import('./patient/patient.module').then(m => m.PatientModule)
  },
  {
    path: 'ward-monitor',
    loadChildren: () => import('./ward-monitor/ward-monitor.module').then(m => m.WardMonitorModule)
  },
  {
    path: 'admin',
    loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
