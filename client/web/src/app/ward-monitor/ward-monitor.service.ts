import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { AllPatientResponseData, PatientAdmitData, PatientData } from './models/patient.model';

@Injectable({
  providedIn: 'root'
})
export class WardMonitorService {

  private baseURL = environment.url

  // patients: PatientData[] = [
  //   {
  //     id: '1',
  //     name: 'Ragnarok',
  //     bp: '80-120',
  //     pulse: '93',
  //     primary_disease: 'Cholera',
  //     temperature: `101'c`
  //   },
  //   {
  //     id: '2',
  //     name: 'Thor',
  //     bp: '80-120',
  //     pulse: '93',
  //     primary_disease: 'Cholera',
  //     temperature: `101'c`
  //   },
  //   {
  //     id: '3',
  //     name: 'Tony',
  //     bp: '80-120',
  //     pulse: '93',
  //     primary_disease: 'Cholera',
  //     temperature: `101'c`
  //   },
  // ]

  constructor(private http: HttpClient) { }

  getAllPatientInfo() {
    return this.http.get<AllPatientResponseData>(`${this.baseURL}/patients`)
    // return this.patients.slice()
  }

  getPatient(id: string) {
    console.log('hit');
    
    return this.http.get<PatientData>(`${this.baseURL}/patients/${id}`)
  }

  admitPatient(patientData: PatientAdmitData) {
    return this.http
      .post(`${this.baseURL}/patients`, patientData)
      .pipe(
        tap(
          res => {
            console.log(res);
          }
        ),
        catchError(this.handleError)
      )
  }

  private handleError(error: HttpErrorResponse) {
    console.log(error);

    let errorMessage = 'An unknown Error'
    if (!error.error || !error.error.error) {
      return throwError(errorMessage)
    }
    switch (error.error.error) {
      case 'EMAIL_EXISTS':
        errorMessage = 'Email Already in Use!'
        break;
      case 'Invalid Credentials':
        errorMessage = 'Invalid Credentials!'
        break;

      default:
        break;
    }
    return throwError(errorMessage)

  }
}
