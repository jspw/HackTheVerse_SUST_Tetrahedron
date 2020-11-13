import { AfterViewInit, Component, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DoctorService } from '../doctor.service';
import { AppointmentListData } from '../models/appointment.model';

/** Constants used to fill up our data base. */

@Component({
  selector: 'app-appointment-table',
  templateUrl: './appointment-table.component.html',
  styleUrls: ['./appointment-table.component.css']
})
export class AppointmentTableComponent implements AfterViewInit {
  displayedColumns: string[] = ['image', 'name', 'time', 'email', 'mobile', 'disease'];
  dataSource: MatTableDataSource<AppointmentListData>;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private doctorService: DoctorService) {
    // Create 100 users
    let appointmentList = doctorService.getAppointmentList()

    // Assign the data to the data source for the table to render
    this.dataSource = new MatTableDataSource(appointmentList);
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}