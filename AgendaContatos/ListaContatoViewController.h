//
//  ListaContatoViewController.h
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ViewController.h"

@interface ListaContatoViewController : UITableViewController<ViewControllerDelegate>

@property Contato *contatoSelecionado;
@property ContatoDAO *contatoDAO;
@property NSInteger linhaSelecionada;

@end
