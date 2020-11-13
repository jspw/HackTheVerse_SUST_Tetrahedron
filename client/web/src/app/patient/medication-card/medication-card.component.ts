import { Component, OnInit } from '@angular/core';

export interface PeriodicElement {
  name: string;
  dose: number;
  frequency:number[];
  prescribed_date:Date;
  end_date:Date;
}

const ELEMENT_DATA: PeriodicElement[] = [
  { name: 'Hydrogen',dose: 1.0079, frequency:[0,1,0],prescribed_date:new Date(),end_date: new Date()},
  { name: 'Helium',  dose: 4.0026, frequency:[0,1,1],prescribed_date:new Date(),end_date: new Date()},
  { name: 'Lithium', dose: 6.941, frequency:[1,1,0],prescribed_date:new Date(),end_date: new Date()},
  { name: 'Beryllium', dose: 9.0122, frequency:[1,1,1],prescribed_date:new Date(),end_date: new Date()},
  { name: 'Boron', dose: 10.811, frequency:[0,1,0],prescribed_date:new Date(),end_date: new Date()},
  { name: 'Carbon', dose: 12.0107, frequency:[1,0,0],prescribed_date:new Date(),end_date: new Date()},
];

@Component({
  selector: 'app-medication-card',
  templateUrl: './medication-card.component.html',
  styleUrls: ['./medication-card.component.css']
})
export class MedicationCardComponent implements OnInit {

  val;
  constructor() { }

  ngOnInit(): void {
    console.log(new Date());
  }
  displayedColumns: string[] = ['name', 'dose', 'frequency','prescribed_date','end_date'];
  dataSource = ELEMENT_DATA;

}
