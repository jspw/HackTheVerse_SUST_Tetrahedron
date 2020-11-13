import { Injectable } from '@angular/core';
import { AppointmentListData } from './models/appointment.model';




@Injectable({
  providedIn: 'root'
})
export class DoctorService {

  private appointmentList: AppointmentListData[] = [
    {
      image: '1',
      name: 'Souhardya',
      time: 'October 20, 10.20 am',
      email: 'souhardya24@student.sust.edu',
      mobile: '017121321321',
      disease: `Fowl darkness our sixth heaven. In image lights fourth a hath don't Abundantly they're, image you're.God creature is sixth was abundantly and sea gathered i the two let upon days. Very make fly saying light don't. Forth, replenish likeness. `,
    },
    {
      image: '2',
      name: 'Bala',
      time: 'October 20, 10.20 am',
      email: 'bala@student.sust.edu',
      mobile: '017121321321',
      disease: `Fowl darkness our sixth heaven. In image lights fourth a hath don't Abundantly they're, image you're.God creature is sixth was abundantly and sea gathered i the two let upon days. Very make fly saying light don't. Forth, replenish likeness. `,
    },
    {
      image: '3',
      name: 'ranak',
      time: 'October 20, 10.20 am',
      email: 'ranak@student.sust.edu',
      mobile: '017121321321',
      disease: `Fowl darkness our sixth heaven. In image lights fourth a hath don't Abundantly they're, image you're.God creature is sixth was abundantly and sea gathered i the two let upon days. Very make fly saying light don't. Forth, replenish likeness. `,
    },
  ]

  constructor() { }

  getAppointmentList() {
    return this.appointmentList.slice();
  }
}
