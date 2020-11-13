import { NgModule } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from '@angular/material/radio';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatButtonToggleModule } from '@angular/material/button-toggle';
import { MatIconModule } from '@angular/material/icon';
import { MatBadgeModule } from '@angular/material/badge';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSidenavModule } from '@angular/material/sidenav';
import { FormsModule } from '@angular/forms';
import { MatMenuModule } from '@angular/material/menu';
import { MatListModule } from '@angular/material/list'
import { MatDialogModule } from '@angular/material/dialog';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatSelectModule } from '@angular/material/select';
import { MatNativeDateModule } from '@angular/material/core';
import { MatStepperModule } from '@angular/material/stepper';

import { FlexLayoutModule } from '@angular/flex-layout';

import { MglTimelineModule } from 'angular-mgl-timeline';


@NgModule({
    exports: [
        MatCardModule,
        MatButtonModule,
        MatInputModule,
        MatRadioModule,
        MatTableModule,
        MatPaginatorModule,
        MatSortModule,
        MatButtonModule,
        MatButtonToggleModule,
        MatIconModule,
        MatBadgeModule,
        MatProgressSpinnerModule,
        MatToolbarModule,
        MatSidenavModule,
        FormsModule,
        MatMenuModule,
        MatListModule,
        MatDialogModule,
        MatDatepickerModule,
        MatSelectModule,
        MatNativeDateModule,
        MatStepperModule,

        FlexLayoutModule,

        MglTimelineModule,
        
    ]
})
export class MaterialModule { }
