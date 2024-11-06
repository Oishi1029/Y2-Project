//configure ADC1 on PA0 
//dont configure CCM

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include <stdio.h>
#include <string.h>

int main(void)
{
	uint16_t raw;
	char uart_buf[50];

// in while loop
while (1)
  {
	  HAL_ADC_Start(&hadc1);
	  HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
	  raw = HAL_ADC_GetValue(&hadc1);

	  sprintf(uart_buf, "%hu\r\n", raw);
	  HAL_UART_Transmit(&huart2, (uint8_t*)uart_buf,strlen(uart_buf), HAL_MAX_DELAY);

	  HAL_Delay(1);

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
}
