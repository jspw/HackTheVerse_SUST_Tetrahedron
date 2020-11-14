import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '../material.module';

import { PatientRoutingModule } from './patient-routing.module';
import { PatientComponent } from './patient.component';
import { ReactiveFormsModule } from '@angular/forms';
import { AppointmentFormComponent } from './appointment-form/appointment-form.component';
import { AppointmentHomeComponent } from './appointment-home/appointment-home.component';
import { MedicalTimelineComponent } from './medical-timeline/medical-timeline.component';
import { MedicationCardComponent } from './medication-card/medication-card.component';
import {AgmCoreModule} from '@agm/core';
import { DataVisualizationHorizontalBarComponent } from './data-visualization-horizontal-bar/data-visualization-horizontal-bar.component';


@NgModule({
  declarations: [
    PatientComponent,
    AppointmentFormComponent,
    AppointmentHomeComponent,
    MedicalTimelineComponent,
    MedicationCardComponent,
    DataVisualizationHorizontalBarComponent,
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    PatientRoutingModule,
    MaterialModule,
  ]
})
export class PatientModule { }
