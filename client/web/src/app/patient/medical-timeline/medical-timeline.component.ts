import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-medical-timeline',
  templateUrl: './medical-timeline.component.html',
  styleUrls: ['./medical-timeline.component.css']
})
export class MedicalTimelineComponent implements OnInit {

  alternate: boolean = false;
  toggle: boolean = false;
  color: boolean = true;
  focusOnOpen: boolean = true
  size: number = 40;
  expandEnabled: boolean = true;
  contentAnimation: boolean = true;
  dotAnimation: boolean = true;
  side = 'right';

  entries = [
    {
      header: {
        doctor: 'Dr. Gar',
        date: '16/12/2020'
      },
      content: {
        medicines: [
          {
            name: 'Anin',
            frequency: '1-0-1'
          },
          {
            name: 'Prazopres',
            frequency: '1-0-1'
          },
          {
            name: 'Napa',
            frequency: '1-1-1'
          },

        ]
      }
    },
    {
      header: {
        doctor: 'Dr. Gar',
        date: '16/12/2020'
      },
      content: {
        medicines: [
          {
            name: 'Anin',
            frequency: '1-0-1'
          },
          {
            name: 'Prazopres',
            frequency: '1-0-1'
          },
          {
            name: 'Napa',
            frequency: '1-1-1'
          },

        ]
      }
    },
    {
      header: {
        doctor: 'Dr. Gar',
        date: '16/12/2020'
      },
      content: {
        medicines: [
          {
            name: 'Anin',
            frequency: '1-0-1'
          },
          {
            name: 'Prazopres',
            frequency: '1-0-1'
          },
          {
            name: 'Napa',
            frequency: '1-1-1'
          },

        ]
      }
    },
  ]

  constructor() { }

  ngOnInit(): void {
  }

  addEntry() {
    // this.entries.push({
    //   header: 'header',
    //   content: 'content'
    // })
  }

  removeEntry() {
    this.entries.pop();
  }

  onHeaderClick(event) {
    if (!this.expandEnabled) {
      event.stopPropagation();
    }
  }

  onDotClick(event) {
    if (!this.expandEnabled) {
      event.stopPropagation();
    }
  }

  onExpandEntry(expanded, index) {
    console.log(`Expand status of entry #${index} changed to ${expanded}`)
  }

  toggleSide() {
    this.side = this.side === 'left' ? 'right' : 'left';
  }

}
