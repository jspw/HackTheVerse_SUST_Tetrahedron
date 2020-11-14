import { Component, OnInit } from '@angular/core';
import * as Chart from 'chart.js';
@Component({
  selector: 'app-data-visualization',
  templateUrl: './data-visualization.component.html',
  styleUrls: ['./data-visualization.component.css']
})
export class DataVisualizationComponent implements OnInit {

  constructor() { }
  sidenav = false;

  //Line Diagram Starts
  LineCharttitle = 'dashboard';
  Linechart =[];
  public LinechartLables : Array<any> =['January', 'February', 'March', 'April', 'May', 'June', 'July'];
  public LinedatasetLable : Array<any> = ['Normal Condition','Moderate Risk',"Severe Risk"];
  public LinecurrentData : Array<number>= [65, 59, 80, 81, 56, 55, 40];
  ngOnInit(): void {
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
            borderWidth: 3,
            fill:false,
            // lineTension: 0,   
            // steppedLine:true,
            // spanGaps:true
            // showline:true
            
          },
          {
            label: this.LinedatasetLable[0],
            data: [60, 60, 60, 60, 60, 60, 60], 
            backgroundColor: '#ff8d89',
            borderColor: 'rgba(0, 10, 130, .7)',
            borderWidth: 1.5,
          },
          {
            label: this.LinedatasetLable[1],
            data: [70, 70, 70, 70, 70, 70, 70], 
            backgroundColor: '#ff4863',
            borderColor: 'rgba(0, 10, 130, .7)',
            borderWidth: 1.5,
          },
          {
            label: this.LinedatasetLable[2],
            data: [90, 90, 90, 90, 90, 90, 90], 
            backgroundColor: '#ff2b50',
            borderColor: 'rgba(0, 10, 130, .7)',
            borderWidth: 1.5,
          },
         
        ]
      }
    })
  }
  //Line Diagram Ends

  public chartOptions: any = {
    responsive: true,
    scales: {
      yAxes: [{
          ticks: {
              max: 5,
              min: 0,
              stepSize: 0.5
          }
      }]
    }
  };
  public chartClicked(e: any): void { }
  public chartHovered(e: any): void { }

}
