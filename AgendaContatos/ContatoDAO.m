//
//  ContatoDAO.m
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO *defaultDao = nil;

-(id)init{
    self = [super init];
    if (self){
        self.contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatoDAO *)contatoDaoInstance{
    if(!defaultDao){
        defaultDao = [ContatoDAO new];
    }
    return defaultDao;
}


-(void)AdicionarContato:(Contato *)poContato{
    [self.contatos addObject:poContato];
}

-(NSInteger)totalContatos{
    return self.contatos.count;
}

-(Contato *) contatoDoIndice:(NSInteger) pnIndice{
    return self.contatos[pnIndice];
}

-(void)removerContato:(Contato *)poContato{
    [self.contatos removeObject:poContato];
}
@end
