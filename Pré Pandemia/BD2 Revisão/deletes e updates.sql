update inscricao
set forma_pagamento = 2
where participante_fk = 2;

delete from inscricao 
where participante_fk = 3;