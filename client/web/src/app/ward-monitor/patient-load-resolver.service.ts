import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { PatientData } from './models/patient.model';
import { WardMonitorService } from './ward-monitor.service';

@Injectable({
  providedIn: 'root'
})

export class PatientLoadResolverService implements Resolve<any> {

  constructor(private wardMonitorService: WardMonitorService) { }

  resolve(route: ActivatedRouteSnapshot): Observable<any> | Promise<any> | any {
    return this.wardMonitorService.getPatient(route.params['id']);
  }
}