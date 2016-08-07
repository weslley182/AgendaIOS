//
//  ListaContatoViewController.m
//  AgendaContatos
//
//  Created by Mac on 8/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ListaContatoViewController.h"
#import "ViewController.h"
#import "Contato.h"

@interface ListaContatoViewController ()

@end

@implementation ListaContatoViewController

-(id) init{
    self = [super init];
    if(self){
        UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                   target:self action:@selector(exibirFormulario)];
    
        self.navigationItem.rightBarButtonItem = botaoForm;
        self.navigationItem.title = @"Lista de contatos";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        self.contatoDAO = [ContatoDAO contatoDaoInstance];
    }
    return self;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self removerItemTela:indexPath];
    }
}

-(void)removerItemTela:(NSIndexPath *)pnIndex{
    Contato *contato = [self.contatoDAO contatoDoIndice:pnIndex.row];
    [self.contatoDAO removerContato:contato];
    [self.tableView deleteRowsAtIndexPaths: @[pnIndex] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.contatoDAO contatoDoIndice:indexPath.row];
    [self exibirFormulario];
}

-(void) exibirFormulario{
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyB instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    [self.navigationController pushViewController:form animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatoDAO totalContatos];
}

-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:
(nonnull NSIndexPath *)indexPath{
    
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    
    Contato *contato = [self.contatoDAO contatoDoIndice:indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

@end
