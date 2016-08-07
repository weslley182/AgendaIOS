//
//  Contato.m
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description{
    NSString *dados =
        [NSString stringWithFormat:@"Nome: %@, Endereço: %@, E-mail: %@, Site: %@, Telefone: %@",
         self.nome, self.endereco, self.email, self.site, self.telefone];
    return dados;
}

@end
