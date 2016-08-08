//
//  ContatoDAO.h
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

-(void) AdicionarContato:(Contato *)poContato;
-(NSInteger) totalContatos;
-(Contato *) contatoDoIndice:(NSInteger) pnIndice;
-(NSInteger) indiceDoContato:(Contato *)poContato;
+(ContatoDAO *) contatoDaoInstance;
-(void) removerContato:(Contato *) poContato;

@end
