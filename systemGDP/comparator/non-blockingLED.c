// allows you to run other code while waiting for the LED to toggle.
// in the CubeMX perspective, change the Timer 16 prescaler to 7999 (“8000 - 1”). 
//With a main CPU clock of 80 MHz, our timer will now tick at a rate of 10 kHz (80 MHz / 8000 = 10 kHz).

/* Includes ------------------------------------------------------------------*/
#include "main.h"

int main(void)
{
  /* USER CODE BEGIN 1 */
  uint16_t timer_val;

  /* USER CODE BEGIN 2 */

  // Start timer
  HAL_TIM_Base_Start(&htim16);

  // Get current time (microseconds)
  timer_val = __HAL_TIM_GET_COUNTER(&htim16);

  /* USER CODE END 2 */

/* USER CODE BEGIN WHILE */
  while (1)
  {
    // If enough time has passed (1 second), toggle LED and get new timestamp
    if (__HAL_TIM_GET_COUNTER(&htim16) - timer_val >= 10000)
    {
      HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
      timer_val = __HAL_TIM_GET_COUNTER(&htim16);
    }

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }

}
