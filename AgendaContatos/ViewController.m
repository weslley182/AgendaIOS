//
//  ViewController.m
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"


@implementation ViewController

-(id)initWithCoder: (NSCoder *) aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //self.navigationItem.rightBarButtonItem = [self receberBotao];
        self.contatoDAO = [ContatoDAO contatoDaoInstance];
    }
    return self;
}

-(UIBarButtonItem *)receberBotao{
    if (self.contato){
        return [self receberBotaoAlterar];
    }
    return [self receberBotaoAdicionar];
}

-(UIBarButtonItem *)receberBotaoAlterar{
    self.navigationItem.title = @"Alterar contato";
    return [[UIBarButtonItem alloc]
            initWithTitle:@"Alterar"
            style:UIBarButtonItemStylePlain
            target:self
            action:@selector(alterar)];
}

-(UIBarButtonItem *)receberBotaoAdicionar{
    self.navigationItem.title = @"Novo contato";
    return [[UIBarButtonItem alloc]
           initWithTitle:@"Adicionar"
            style:UIBarButtonItemStylePlain
            target:self
            action:@selector(adicionar)];
}

-(void) viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [self receberBotao];
    [self carregarDadosTelaContato];
}

-(void)carregarDadosTelaContato{
    
    if(!self.contato){
        return;
    }
    self.nome.text = self.contato.nome;
    self.endereco.text = self.contato.endereco;
    self.telefone.text = self.contato.telefone;
    self.site.text = self.contato.site;
    self.email.text = self.contato.email;
}

-(void)alterar{
    [self carregarContatos];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) adicionar {
    self.contato = [Contato new];
    [self carregarContatos];
    [self.contatoDAO AdicionarContato: self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) carregarContatos{
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.telefone = self.telefone.text;
    self.contato.site = self.site.text;
    self.contato.email = self.email.text;
}


@end
