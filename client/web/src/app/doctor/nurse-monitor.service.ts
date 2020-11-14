import { Injectable } from '@angular/core';
import { PatientData } from './models/patient.model';

@Injectable({
  providedIn: 'root'
})
export class NurseMonitorService {

  patients: PatientData[] = [
    {
      id: '1',
      name: 'Ragnarok',
      bp: '80-120',
      pulse: '93',
      primary_disease: 'Cholera',
      temperature: `101'c`
    },
    {
      id: '2',
      name: 'Thor',
      bp: '80-120',
      pulse: '93',
      primary_disease: 'Cholera',
      temperature: `101'c`
    },
    {
      id: '3',
      name: 'Tony',
      bp: '80-120',
      pulse: '93',
      primary_disease: 'Cholera',
      temperature: `101'c`
    },
  ]

  constructor() { }

  getAllPatientInfo() {
    return this.patients.slice()
  }
}
