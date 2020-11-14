import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { PatientData, AllPatientResponseData } from '../../models/patient.model';
import { WardMonitorService } from '../../ward-monitor.service';

@Component({
  selector: 'app-patient-status-table',
  templateUrl: './patient-status-table.component.html',
  styleUrls: ['./patient-status-table.component.css']
})
export class PatientStatusTableComponent implements OnInit{
  displayedColumns: string[] = ['name', 'disease', 'bed', 'age',];
  dataSource: MatTableDataSource<PatientData>;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private wardMonitorService: WardMonitorService) {
    // Create 100 users
    

    // Assign the data to the data source for the table to render
    // this.dataSource = new MatTableDataSource(patientList);
  }

  ngOnInit() {
    this.wardMonitorService.getAllPatientInfo().subscribe(
      (patients) => {
        console.log(patients);
        this.dataSource = new MatTableDataSource(patients.data.patient)
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      }
    )
  }

  ngAfterViewInit() {
    
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
