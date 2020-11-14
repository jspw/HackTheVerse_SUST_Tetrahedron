import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { WardMonitorService } from '../ward-monitor.service';

@Component({
  selector: 'app-patient-admission-form',
  templateUrl: './patient-admission-form.component.html',
  styleUrls: ['./patient-admission-form.component.css']
})
export class PatientAdmissionFormComponent implements OnInit {
  patientAdmissionForm: FormGroup
  

  constructor(private wardMonitorService: WardMonitorService) { }

  ngOnInit(): void {
    this.formInit()
  }

  private formInit() {
    let name = '';
    let age = '';
    let disease = '';
    let bed = '';
    let note = '';
    this.patientAdmissionForm = new FormGroup({
      name: new FormControl(name, [Validators.required]),
      age: new FormControl(age, [Validators.required]),
      disease: new FormControl(disease, [Validators.required]),
      bed: new FormControl(bed, [Validators.required]),
      note: new FormControl(note, [Validators.required]),
    })
  }

  onSubmit() {
    console.log(this.patientAdmissionForm.value)
    this.wardMonitorService.admitPatient(this.patientAdmissionForm.value).subscribe(
      (res) => {
        console.log(res);
        
      }
    )
  }
}
