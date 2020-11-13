import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-appointment-home',
  templateUrl: './appointment-home.component.html',
  styleUrls: ['./appointment-home.component.css']
})
export class AppointmentHomeComponent implements OnInit {

  User_Name  = "Andrew";
  constructor() { }

  ngOnInit(): void {
  }

}
