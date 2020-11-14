import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Data, Params } from '@angular/router';
import { PatientData } from '../models/patient.model';

@Component({
  selector: 'app-patient-profile',
  templateUrl: './patient-profile.component.html',
  styleUrls: ['./patient-profile.component.css']
})
export class PatientProfileComponent implements OnInit {

  id
  patient: PatientData
  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params: Params) => {
        this.id = params['id']
        this.getDataFromResolver()
      }
    )
  }

  private getDataFromResolver() {
    this.route.data.subscribe(
      (data: Data) => {
        this.patient = data['patient']
        console.log(this.patient);
        
      }
    )
  }

}
