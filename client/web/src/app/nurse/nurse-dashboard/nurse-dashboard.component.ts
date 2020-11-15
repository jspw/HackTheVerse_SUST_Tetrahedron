import { Component, OnInit } from '@angular/core';
import {Chart} from 'chart.js';

@Component({
  selector: 'app-nurse-dashboard',
  templateUrl: './nurse-dashboard.component.html',
  styleUrls: ['./nurse-dashboard.component.css']
})
export class NurseDashboardComponent implements OnInit {

  sidenav = false;
  constructor() { }
  
  //Pie Chart
  title = 'dashboard';
  chart =[];

  public chartLables : Array<any> =['January', 'February', 'March'];
  public datasetLable : Array<any> = ['Normal Condition','Moderate Risk',"Severe Risk"];
  public currentData : Array<number>= [30,40,30];


  //StackChart
  Stackchart =[];

  public StackchartLables : Array<any> =['January', 'February', 'March'];
  public StackdatasetLable : Array<any> = ['Normal Condition','Moderate Risk',"Severe Risk"];
  public StackcurrentData : Array<number>= [30,40,30];

  ngOnInit(): void {
    //PieStyle
    this.chart = new Chart('canvas1',{
      type:'pie',
      data:{
        labels: this.datasetLable,
        weight:100,
        datasets:[
          {
            label: 'Current Status',
            data: this.currentData,
            backgroundColor: [
              'rgba(219, 0, 0, 0.1)',
              'rgba(0, 165, 2, 0.1)',
              'rgba(255, 195, 15, 0.2)',
              'rgba(55, 59, 66, 0.1)',
              'rgba(0, 0, 0, 0.3)'
            ],
            hoverBackgroundColor: [
              'rgba(219, 0, 0, 0.2)',
              'rgba(0, 165, 2, 0.2)',
              'rgba(255, 195, 15, 0.3)',
              'rgba(55, 59, 66, 0.1)',
              'rgba(0, 0, 0, 0.4)'
            ],
            borderColor: '#2F0147',
            borderWidth: 3,
            
          }
        ]
      }
    }),

   //StackStyle
   this.Stackchart = new Chart('stackCanvas',{
    type:'bar',
    data:{
      labels: ["<  1","1 - 2","3 - 4","5 - 9","10 - 14","15 - 19","20 - 24","25 - 29","> - 29"],
      datasets:[
        {
          label: 'Seat Booked',
          backgroundColor: "#caf270",
          data: [12, 59, 5, 56, 58,12, 59, 87, 45],
          borderColor: '#2F0147',
          borderWidth: 3,
          stack:'a'
        },
        {
          label: 'Available Seat',
          backgroundColor: "#2e5468",
          data: [12, 59, 5, 56, 58, 12, 59, 12, 74],
          borderColor: '#2F0147',
          borderWidth: 3,
          stack:'a'
         }
      ]
    }
  })
  }

  public chartOptions: any = {
    responsive: true
  };
  public chartClicked(e: any): void { }
  public chartHovered(e: any): void { }

}
