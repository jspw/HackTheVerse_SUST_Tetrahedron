import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-patient-admission',
  templateUrl: './patient-admission.component.html',
  styleUrls: ['./patient-admission.component.css']
})
export class PatientAdmissionComponent implements OnInit {

  patientAdmissionForm: FormGroup
  isLinear : boolean = true;
  constructor() { }

  ngOnInit(): void {
    let name = '';
    let age;
    let disease = '';
    let bed;
    let note ='';
    this.patientAdmissionForm = new FormGroup({
      name : new FormControl(name,[Validators.required]),
      age : new FormControl(age,[Validators.required]),
      disease : new FormControl(disease,[Validators.required]),
      bed : new FormControl(bed,[Validators.required]),
    })
  }
  onSubmit(){
    console.log(this.patientAdmissionForm.value);
  }

}
