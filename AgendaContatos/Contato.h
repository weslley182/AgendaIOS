//
//  Contato.h
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

@property NSString *nome;
@property NSString *endereco;
@property NSString *telefone;
@property NSString *site;
@property NSString *email;

@property NSMutableArray *contatos;

@end
