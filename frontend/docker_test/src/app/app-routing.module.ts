import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'folder/Immo1',
    pathMatch: 'full'
  },
  {
    path: 'folder/:id',
    loadChildren: () => import('./pages/folder/folder.module').then(m => m.FolderPageModule)
  },
  {
    path: 'folder/:id/general/:id',
    loadChildren: () => import('./pages/general/general.module').then(m => m.GeneralPageModule)
  },
  {
    path: 'folder/:id/general/:id/room-detail',
    loadChildren: () => import('./pages/room-detail/room-detail.module').then(m => m.RoomDetailPageModule)
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
