import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-general',
  templateUrl: './general.page.html',
  styleUrls: ['./general.page.scss'],
})
export class GeneralPage implements OnInit {

  public room: any;
  public infoVisible: boolean;
  public werteVisible: boolean;
  public mapVisible: boolean;
  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.room = this.activatedRoute.snapshot.paramMap.get('id');
    this.infoVisible = true;
    this.werteVisible = false;
    this.mapVisible = false;
  }


  segmentChanged($event) {

    const currentValue = $event.detail.value;

    switch (currentValue) {
      case 'info':
        this.infoVisible = true;
        this.mapVisible = false;
        this.werteVisible = false;
        break;
      case 'werte':
        this.infoVisible = false;
        this.mapVisible = false;
        this.werteVisible = true;
        break;
      case 'map':
        this.infoVisible = false;
        this.mapVisible = true;
        this.werteVisible = false;
        break;
      default:
        break;
    }

  }

}
