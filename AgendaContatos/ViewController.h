//
//  ViewController.h
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@protocol ViewControllerDelegate <NSObject>

@required
-(void) contatoAdicionado: (Contato *) contato;
-(void) contatoAtualizado: (Contato *) contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;
@property IBOutlet UITextField *email;

@property ContatoDAO *contatoDAO;
@property Contato *contato;
@property id<ViewControllerDelegate> delegate;

@end

