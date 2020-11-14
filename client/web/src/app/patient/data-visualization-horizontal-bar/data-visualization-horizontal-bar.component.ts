import { Component, OnInit } from '@angular/core';
import {Chart} from 'chart.js';

@Component({
  selector: 'app-data-visualization-horizontal-bar',
  templateUrl: './data-visualization-horizontal-bar.component.html',
  styleUrls: ['./data-visualization-horizontal-bar.component.css']
})
export class DataVisualizationHorizontalBarComponent implements OnInit {

  constructor() { }
  title = 'Overview of patient Status';
  chart =[];
  public chartLabels: Array<any> = ['Emergency Condition', 'Moderate risk condition', 'Stable Condition'];
  // public chartLables : Array<any> =['January', 'February', 'March', 'April', 'May', 'June', 'July'];
  public currentData: Array<any> =  [65, 59, 80];
  ngOnInit(): void {
    this.chart = new Chart('canvas3',{
      type:'horizontalBar',
      data:{
        labels: this.chartLabels,
        datasets:[
          {
            data: this.currentData,
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255,99,132,1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2,
            
          },
        ]
      }
    })
  }

  public chartType: string = 'horizontalBar';

 

  

  public chartOptions: any = {
    responsive: true
  };
  public chartClicked(e: any): void { }
  public chartHovered(e: any): void { }

}
