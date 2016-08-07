//
//  ListaContatoViewController.h
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@interface ListaContatoViewController : UITableViewController

@property Contato *contatoSelecionado;

@property ContatoDAO *contatoDAO;

@end
