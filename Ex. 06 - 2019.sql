/* Atividade realizada em 2019 */

CREATE DEFINER=`root`@`localhost` TRIGGER `cantina`.`pedido_BEFORE_UPDATE` BEFORE UPDATE ON `pedido` FOR EACH ROW
BEGIN
	SET NEW.valor_final  = (select qtd from salgados
								where salgados.id_salgados = NEW.id_salgados) 
                                                                                 
													* 
                                                                                 
								(select precosalgado from salgados
								where salgados.id_salgados = NEW.id_salgados);
                                
                                SET NEW.valor_final  = (select qtd from bebidas
								where bebidas.id_bebidas = NEW.id_bebidas) 
                                                                                 
													* 
                                                                                 
								(select precofudido from bebidas
								where bebidas.id_bebidas = NEW.id_bebidas);
END