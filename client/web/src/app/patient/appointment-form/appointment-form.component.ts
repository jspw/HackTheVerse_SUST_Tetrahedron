import { Component, OnChanges, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-appointment-form',
  templateUrl: './appointment-form.component.html',
  styleUrls: ['./appointment-form.component.css']
})
export class AppointmentFormComponent implements OnInit {

  categoryForm: FormGroup
  doctorForm: FormGroup
  appointmentForm: FormGroup
  minDate: Date
  maxDate: Date
  isLinear : boolean = true;

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
  categories = [
    {
      title: 'Eye-Ear-Skin'
    },
    {
      title: 'Skin'
    },
    {
      title: 'Nephrology'
    },
  ]
  
  constructor() { }

  ngOnInit() {
    this.formInit()
    this.minDate = new Date()
    this.maxDate = new Date()
    this.maxDate.setDate(new Date().getDate() + 7)
  }

  private formInit() {
    let category = ''
    this.categoryForm = new FormGroup({
      category: new FormControl(category, [Validators.required])
    })  

    let doctor = ''
    this.doctorForm = new FormGroup({
      doctor: new FormControl(doctor, [Validators.required])
    }) 

    let appointment_date = ''
    let disease = ''
    let details = ''

    this.appointmentForm = new FormGroup({
      appointment_date: new FormControl(appointment_date, [Validators.required]),
      disease: new FormControl(disease, [Validators.required]),
      details: new FormControl(details, [Validators.required]),
    })  
  }

  onCategorySubmit() {
    console.log(this.categoryForm.value);
    this.doctors.push({
      name: 'Bristy'
    })
  }
  
  onDoctorSubmit() {
    console.log(this.doctorForm.value);
    
  }
  
  onSubmit() {
    console.log(this.appointmentForm.value)
  }
}
