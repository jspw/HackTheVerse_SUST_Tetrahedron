import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-prescription-form',
  templateUrl: './prescription-form.component.html',
  styleUrls: ['./prescription-form.component.css']
})
export class PrescriptionFormComponent implements OnInit {

  prescriptionForm: FormGroup
  minDate: Date
  maxDate: Date
  doctors = [
    {
      name: 'Andrew'
    },
    {
      name: 'Garfield'
    },
    {
      name: 'Patty'
    },
  ]

  constructor() { }

  ngOnInit(): void {
    this.formInit()
    this.minDate = new Date()
    this.maxDate = new Date()
    this.maxDate.setDate(new Date().getDate() + 7)
    console.log(this.maxDate);

  }

  private formInit() {
    let doctor = ''
    let time = ''
    let disease = ''
    let details = ''
    let medicineDetails = new FormArray([])

    this.prescriptionForm = new FormGroup({
      doctor: new FormControl(doctor, [Validators.required]),
      time: new FormControl(time, [Validators.required]),
      disease: new FormControl(disease, [Validators.required]),
      details: new FormControl(details, [Validators.required]),
      medicines: medicineDetails
    })
  }

  onAddMedicine() {
    (<FormArray>this.prescriptionForm.get('medicines')).push(new FormGroup({
      name: new FormControl(null, Validators.required),
      per_day: new FormControl(null, [Validators.required, Validators.min(1)]),
      days: new FormControl(null, [Validators.required, Validators.min(1)]),
      note: new FormControl(null, Validators.required),
    }))
  }

  onDeleteMedicine(index: number) {
    (<FormArray>this.prescriptionForm.get('medicines')).removeAt(+index)
  }

  onSubmit() {
    console.log(this.prescriptionForm.value)
  }

}
