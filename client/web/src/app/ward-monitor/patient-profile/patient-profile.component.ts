import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Data, Params } from '@angular/router';
import { PatientData } from '../models/patient.model';
import * as Chart from 'chart.js';

@Component({
  selector: 'app-patient-profile',
  templateUrl: './patient-profile.component.html',
  styleUrls: ['./patient-profile.component.css']
})
export class PatientProfileComponent implements OnInit {

  id
  patient: any
  constructor(private route: ActivatedRoute) { }
  sidenav = false;

  //Line Diagram Starts
  LineCharttitle = 'dashboard';
  Linechart =[];
  public LinechartLables : Array<number> = new Array;
  public LinedatasetLable : Array<any> = ['Normal Condition','Moderate Risk',"Severe Risk"];
  public LinecurrentData : Array<number>;
  private getDataFromResolver() {
    this.route.data.subscribe(
      (data: Data) => {
        this.patient = data['patient']
        this.LinecurrentData = this.patient.data.sensorData[1].value;
      }
    )
  }
  in = 0;varri;
  User_Name = '';
  ngOnInit(): void {
    console.log(this.LinecurrentData);
    this.route.data.subscribe(
    (data: Data) => {
      this.patient = data['patient']
      this.LinecurrentData = this.patient.data.sensorData[1].value;
      // console.log(this.patient.data.patient.name);
      this.User_Name = this.patient.data.patient.name
      for(var i = 0;i<this.LinecurrentData.length;i++){
        this.LinechartLables.push(i);
      }
      
    }
  ),
    this.Linechart = new Chart('canvas',{
      type:'line',
      data:{
        labels: this.LinechartLables,
      
        datasets:[
          {
            label: 'Current Status',
            data: this.LinecurrentData,
            backgroundColor: '#2F0147',
            borderColor: '#5398BE',
            borderWidth: 2,
            fill:false,
            pointRadius: 0,
            // lineTension: 0,   
            // steppedLine:true,
            // spanGaps:true
            // showline:true
            
          },
          
          // {
          //   label: this.LinedatasetLable[0],
          //   data: [60, 60, 60, 60, 60, 60, 60], 
          //   backgroundColor: '#ff8d89',
          //   borderColor: 'rgba(0, 10, 130, .7)',
          //   borderWidth: 1.5,
          // },
          // {
          //   label: this.LinedatasetLable[1],
          //   data: [70, 70, 70, 70, 70, 70, 70], 
          //   backgroundColor: '#ff4863',
          //   borderColor: 'rgba(0, 10, 130, .7)',
          //   borderWidth: 1.5,
          // },
          // {
          //   label: this.LinedatasetLable[2],
          //   data: [90, 90, 90, 90, 90, 90, 90], 
          //   backgroundColor: '#ff2b50',
          //   borderColor: 'rgba(0, 10, 130, .7)',
          //   borderWidth: 1.5,
          // },
         
        ]
      }
    }),
    this.route.params.subscribe(
      (params: Params) => {
        this.id = params['id']
        this.getDataFromResolver()
      }
    )
  }


  

}
