import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DataVisualizationHorizontalBarComponent } from './data-visualization-horizontal-bar.component';

describe('DataVisualizationHorizontalBarComponent', () => {
  let component: DataVisualizationHorizontalBarComponent;
  let fixture: ComponentFixture<DataVisualizationHorizontalBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DataVisualizationHorizontalBarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DataVisualizationHorizontalBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
