import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { PatientData } from './models/patient.model';
import { WardMonitorService } from './ward-monitor.service';

@Injectable({
  providedIn: 'root'
})

export class PatientLoadResolverService implements Resolve<PatientData> {

  constructor(private wardMonitorService: WardMonitorService) { }

  resolve(route: ActivatedRouteSnapshot): Observable<PatientData> | Promise<PatientData> | PatientData {
    return this.wardMonitorService.getPatient(route.params['id']);
  }
}