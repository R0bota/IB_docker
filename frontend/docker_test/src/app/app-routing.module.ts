import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
<<<<<<< HEAD
    redirectTo: 'folder/Immo1',
=======
    redirectTo: 'folder/Inbox',
>>>>>>> 96648a94b5b369102e0ba3c799f81fd200eeef5f
    pathMatch: 'full'
  },
  {
    path: 'folder/:id',
<<<<<<< HEAD
    loadChildren: () => import('./pages/folder/folder.module').then(m => m.FolderPageModule)
  },
  {
    path: 'folder/:id/general/:id',
    loadChildren: () => import('./pages/general/general.module').then(m => m.GeneralPageModule)
  },
  {
    path: 'folder/:id/general/:id/room-detail',
    loadChildren: () => import('./pages/room-detail/room-detail.module').then(m => m.RoomDetailPageModule)
=======
    loadChildren: () => import('./folder/folder.module').then( m => m.FolderPageModule)
>>>>>>> 96648a94b5b369102e0ba3c799f81fd200eeef5f
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
<<<<<<< HEAD
export class AppRoutingModule { }
=======
export class AppRoutingModule {}
>>>>>>> 96648a94b5b369102e0ba3c799f81fd200eeef5f
