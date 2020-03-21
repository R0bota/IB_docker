import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-folder',
  templateUrl: './folder.page.html',
  styleUrls: ['./folder.page.scss'],
})
export class FolderPage implements OnInit {
  public immo: any;

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.folder = this.activatedRoute.snapshot.paramMap.get('id');
    this.immo = {
      immoName: this.activatedRoute.snapshot.paramMap.get('id'),
      rooms: [
        {
          name: 'Bad',
          icon: 'medkit-outline'
        },
        {
          name: 'Küche',
          icon: 'pizza-outline'
        },
        {
          name: 'Schlafzimmer',
          icon: 'bed-outline'
        }
      ]
    };

  }

}
