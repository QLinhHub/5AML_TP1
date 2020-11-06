function learning_curve(loss, loss_val, ersub, ersub_val, n_iters)
figure;
plot(1:n_iters, loss, 1:n_iters, loss_val);
xlabel('iterations');
ylabel('loss');
legend('loss', 'loss_val');
title('training loss & validation loss');

figure;
hold on
plot(1:n_iters, ersub, 1:n_iters, ersub_val);
xlabel('iterations');
ylabel('ersub');
legend('ersub', 'ersub_val');
title('training ersub & validation ersub');
hold off;
end