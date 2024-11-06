// TIM16
// tick activated, disble channel 
// prescale 80-1
// counter period 65535 - 1

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include <stdio.h>

int main(void)
{
  /* USER CODE BEGIN 1 */
	char uart_buf[50];
	int uart_buf_len;
	uint16_t timer_val;

  uart_buf_len = sprintf(uart_buf, "Timer test\r\n");
  HAL_UART_Transmit(&huart2, (uint8_t *)uart_buf, uart_buf_len,100);

  HAL_TIM_Base_Start(&htim16);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  timer_val = __HAL_TIM_GET_COUNTER(&htim16);

	  HAL_Delay(50);

	  timer_val = __HAL_TIM_GET_COUNTER(&htim16)-timer_val;

	  uart_buf_len = sprintf(uart_buf,"%u us\r\n",timer_val);

	  HAL_UART_Transmit(&huart2,(uint8_t *) uart_buf, uart_buf_len,100);

	  HAL_Delay(1000);
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

  

